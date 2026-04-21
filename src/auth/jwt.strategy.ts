import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import type { Request } from 'express';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(configService: ConfigService) {
    super({
      jwtFromRequest: (req: Request) => {
        let token: string | null = null;

        // Try cookie header directly — manual parse for serverless reliability
        const cookieHeader = req.headers.cookie as string | undefined;
        if (cookieHeader) {
          const match = cookieHeader.match(/(?:^|;\s*)access_token=([^;]*)/);
          if (match) {
            token = decodeURIComponent(match[1]);
          }
          console.log(
            '[JwtStrategy] raw cookie:',
            cookieHeader.substring(0, 50),
          );
          console.log('[JwtStrategy] parsed token:', !!token);
        }

        // Fallback to parsed cookies object
        if (!token && req?.cookies?.access_token) {
          token = req.cookies.access_token as string;
        }

        // Final fallback to bearer header
        if (!token) {
          token = ExtractJwt.fromAuthHeaderAsBearerToken()(req);
        }

        return token;
      },
      ignoreExpiration: false,
      secretOrKey: configService.get<string>('JWT_SECRET')!,
    });
  }

  async validate(payload: { sub: string; zaloId: string }) {
    return { candidateId: payload.sub, zaloId: payload.zaloId };
  }
}

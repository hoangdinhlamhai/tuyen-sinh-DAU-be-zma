import { Controller, Post, Body } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ZaloLoginDto } from './dto/zalo-login.dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('zalo')
  loginWithZalo(@Body() dto: ZaloLoginDto) {
    return this.authService.loginWithZalo(dto.authCode, dto.profile);
  }

  @Post('logout')
  logout() {
    return this.authService.logout();
  }
}

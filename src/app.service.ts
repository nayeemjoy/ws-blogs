import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): { message: string; status: string } {
    return {
      message: 'My NestJS app is running successfully!',
      status: 'success',
    };
  }
}

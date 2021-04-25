export class Usuario {
    id?: number
    usuario?: string
    email?: string
    password?: string
    foto?: string
    rol?: string
}
export interface accesoUsuario{
    email: string
    password: string
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/18 15:33:01 by verosvec          #+#    #+#             */
/*   Updated: 2026/10/06 13:32:53 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	unsigned char		*udest;
	const unsigned char	*usrc;

	if (!dest && !src)
		return (NULL);
	udest = (unsigned char *)dest;
	usrc = (const unsigned char *)src;
	if ((uintptr_t)udest < (uintptr_t)usrc)
		return (ft_memcpy(dest, src, n));
	while (n--)
		udest[n] = usrc[n];
	return (dest);
}

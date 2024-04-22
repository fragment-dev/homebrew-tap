require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.22-darwin-x64.tar.gz"
    sha256 "6705a9c4dda3c9c65603d4f2123e944506e5a66a34d77671ada441ca4480ac51"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.22-darwin-arm64.tar.gz"
      sha256 "448858e7cc13ddd9f5cfb5e317164a35618000c3a528dc99c363e655e478a81b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.22-linux-x64.tar.gz"
    sha256 "b51ad6736ada74da335e28e33dac4f8a46dd17f7162a1875676add49f059c4fc"
  end
  version "2024.4.22"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

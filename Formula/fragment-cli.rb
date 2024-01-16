require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.15-darwin-x64.tar.gz"
    sha256 "39cc81875c68dd833692cc13ba5f8b2a6b1446e2978d0df57f4e21ed287a05c6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.15-darwin-arm64.tar.gz"
      sha256 "8f9bdbd8b1ba257fabf5ff23cc2c72f4b6c7f542f492a0d734857765d73a2662"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.15-linux-x64.tar.gz"
    sha256 "4c93300a5ac399b33d39ec429bfd39eb10f3fbe7ef6dd518ab643eff9c5e279b"
  end
  version "2024.1.15"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

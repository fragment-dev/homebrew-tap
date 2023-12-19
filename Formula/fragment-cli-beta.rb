require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4176.0.0-darwin-x64.tar.gz"
    sha256 "d639309c71e7cdc73a3214d5484843dd225c333c9a32967429a1caa46df0e661"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4176.0.0-darwin-arm64.tar.gz"
      sha256 "2ea05ad90d09712b0018adcd609260277d5ec36d2c93fff9f25b1f5657c14e76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4176.0.0-linux-x64.tar.gz"
    sha256 "46325d19426f12fc126455002ce891df2392628d87563b8b825949414ba36b41"
  end
  version "4176.0.0"
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

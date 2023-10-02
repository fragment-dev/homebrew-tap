require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3739.0.0-darwin-x64.tar.gz"
    sha256 "d92994b77a33ea0df5de17fbdfeea3ca370ffb958e1158f07a3f49365a4bfce5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3739.0.0-darwin-arm64.tar.gz"
      sha256 "4a6a3179b446431ae41ecb808f619ac5ee1b71934fb6b6ff6fc47b160fb0e444"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3739.0.0-linux-x64.tar.gz"
    sha256 "9eee85e54693ea836121ec1d0244276dadc1166b8d678f225eefe71f370809fe"
  end
  version "3739.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

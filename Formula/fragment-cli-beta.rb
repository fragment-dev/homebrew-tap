require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3928.0.0-darwin-x64.tar.gz"
    sha256 "9d39a27cb405b2983e634d4753b6a7b6ca554daaededfbcd65c411f9adcaa042"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3928.0.0-darwin-arm64.tar.gz"
      sha256 "44750406b6633c8724cb66c384fee515c8437f1f6fedf2f8359a4d8ebfe6bfbd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3928.0.0-linux-x64.tar.gz"
    sha256 "21249aece6586988a19df29cd5c2e0dd9313806b8acff2d9a78adafc45689d33"
  end
  version "3928.0.0"
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

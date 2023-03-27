require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2279.0.0-darwin-x64.tar.gz"
    sha256 "5b3448dc07440b67d328174ed89b9c031d22368f106ef808f3f5904b661f0fee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2279.0.0-darwin-arm64.tar.gz"
      sha256 "35ed24e38af6f1b87abf51f2fde14993fc1541e95ff530b76d3ad5237f002bc9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2279.0.0-linux-x64.tar.gz"
    sha256 "e64844f59b1fffcb359863478757043c861a18a2f134b6a409f6963895f00605"
  end
  version "2279.0.0"
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

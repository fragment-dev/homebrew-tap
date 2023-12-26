require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4212.0.0-darwin-x64.tar.gz"
    sha256 "af1915c3c40095a8977847c396dfe0d410b8b0edaa7a13e3c95644042afb3845"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4212.0.0-darwin-arm64.tar.gz"
      sha256 "21a36ea07397c70274ef558018ee7f99b7ca2c0c36927d43e41b5d300e58f302"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4212.0.0-linux-x64.tar.gz"
    sha256 "9748da6725fbfaf32e6e8539c6d625de30bbb639aeb13f334e0897f487fe971f"
  end
  version "4212.0.0"
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

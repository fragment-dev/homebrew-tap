require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4298.0.0-darwin-x64.tar.gz"
    sha256 "984c98a611f2502582acc82525fa74093d2d6c2238f61e58890a8fb24a2354e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4298.0.0-darwin-arm64.tar.gz"
      sha256 "0a15da2e2539c1bc9d70d38f6462eb776c0e8946f9ea1a6bcbc633e84aebd336"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4298.0.0-linux-x64.tar.gz"
    sha256 "4043c0fbecb597311645c8a0ab8e4e6d4b531eb6067671e978177123f1787d2e"
  end
  version "4298.0.0"
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

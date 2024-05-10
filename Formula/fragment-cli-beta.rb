require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5032.0.0-darwin-x64.tar.gz"
    sha256 "1a7366ad78ab84d14ead3bd3270683c4ef2484ef878d5edd405beffa92410058"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5032.0.0-darwin-arm64.tar.gz"
      sha256 "8c9535a4f1f8cf4859912f9da35b9b2a1b2e1ad8c9cc40457aa37b6f1c350559"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5032.0.0-linux-x64.tar.gz"
    sha256 "45c9525bdff809227f369589ef8fe2864c06d2250ce7ebd8ebece3cb92ba26fb"
  end
  version "5032.0.0"
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

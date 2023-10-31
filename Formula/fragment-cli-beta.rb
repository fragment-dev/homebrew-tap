require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3944.0.0-darwin-x64.tar.gz"
    sha256 "2c317bcdab7a27ddef6ddeb10bb92d2428f50b7e29692f72950ae772ab74e3e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3944.0.0-darwin-arm64.tar.gz"
      sha256 "7a8456e0d27d472b4621554cbe3bf44a59196c34a9ff9c40ef74fd16a987694d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3944.0.0-linux-x64.tar.gz"
    sha256 "d7b98309bfded80cce7e61a5f174d9a6a2777fb68f9142e5913317a0ae32d60f"
  end
  version "3944.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4254.0.0-darwin-x64.tar.gz"
    sha256 "7e67f67d2461b51c8ad5a8d16cd633dc4ec4d46a30cacdb9075cc38b5b443991"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4254.0.0-darwin-arm64.tar.gz"
      sha256 "04c198efe6f7496bcc8eda8a4639f4f109d6b928c8e73196e66be336e5b7570b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4254.0.0-linux-x64.tar.gz"
    sha256 "6cbf8075f422917dd89a739b5464c5e15e8b973b86313864ad6e6136aea8b940"
  end
  version "4254.0.0"
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

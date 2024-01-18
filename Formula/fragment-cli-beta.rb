require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4362.0.0-darwin-x64.tar.gz"
    sha256 "9f8c25ef05320a1a5fbd0fdec4f74ec7c33775af20405b8a9e30efd4bccca339"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4362.0.0-darwin-arm64.tar.gz"
      sha256 "5d9accaf6f2578de1b92c46453b767e5461cd83c3fe8e6d492a20dd756aa1530"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4362.0.0-linux-x64.tar.gz"
    sha256 "df57ad1777e9122c6d67fc90f653ce0836d3dedb97b98fc8690add98dd8fc292"
  end
  version "4362.0.0"
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

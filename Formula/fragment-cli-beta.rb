require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4332.0.0-darwin-x64.tar.gz"
    sha256 "77c0da91b4f3fa84d9a8b52787b2f38dd1774225287f3f0b0b43effc202b7600"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4332.0.0-darwin-arm64.tar.gz"
      sha256 "6179116c95275492b059c47f980bd0a9862ed77037ad9000010a05b0af213251"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4332.0.0-linux-x64.tar.gz"
    sha256 "18ffb7af1755f405c0bdf34891a2240f914f392802581cf5e37f5adee750833e"
  end
  version "4332.0.0"
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

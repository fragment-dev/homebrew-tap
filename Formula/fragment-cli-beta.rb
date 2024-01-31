require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4466.0.0-darwin-x64.tar.gz"
    sha256 "f66557b6a6cafe04709fc7e71336c40c71f3833c6d942ad7177bcd11069287b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4466.0.0-darwin-arm64.tar.gz"
      sha256 "553c9efaff85380c6a3066f0490026b210ea39a3f98d3bbaa98d50b482fdf42e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4466.0.0-linux-x64.tar.gz"
    sha256 "695c6750db0a9b6d848588adbcb47a9e479f6a2150d5a1c866a45c4005b67d03"
  end
  version "4466.0.0"
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

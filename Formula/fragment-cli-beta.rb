require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3539.0.0-darwin-x64.tar.gz"
    sha256 "552a8ba532fe3de61ba20b165bc651ecf35287ec5f6bf38cdd6ea206c4e8e55c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3539.0.0-darwin-arm64.tar.gz"
      sha256 "4e6391dd8887fa507e160f3acffc3c57c86509de34dbe9501aabbe79f265eee1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3539.0.0-linux-x64.tar.gz"
    sha256 "5d4992789370e9a071385c25e0b4c6ffc050a4b4b9451b166e7b9a953dfb9009"
  end
  version "3539.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5436.0.0-darwin-x64.tar.gz"
    sha256 "bfd181f234fea149b53508a1f799f7873927e26c229a1740a47feb835371196f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5436.0.0-darwin-arm64.tar.gz"
      sha256 "11012f79522bdbd95b6fb28ee1b3853ff0782d4162b7849cc3ebe67b34a3906c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5436.0.0-linux-x64.tar.gz"
    sha256 "fb6311497c91a83a299a3c1c54494a6d33ad354762a0a5ec04789547b647fc57"
  end
  version "5436.0.0"
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

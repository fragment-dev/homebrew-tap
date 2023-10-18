require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3863.0.0-darwin-x64.tar.gz"
    sha256 "9b2c7822abd4e92b18409d850ef0ab9f3f72944eca232954c77085ea472a1960"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3863.0.0-darwin-arm64.tar.gz"
      sha256 "bab2032aae7dac9a0ee578be112ccd7c3c1222ac4085af40da70d8b2003e1f69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3863.0.0-linux-x64.tar.gz"
    sha256 "5b3276262e0e1e048d0fac54446bdb54c95027f2a7c307e4b3f9067314cfe9cb"
  end
  version "3863.0.0"
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

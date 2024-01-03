require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4252.0.0-darwin-x64.tar.gz"
    sha256 "c086f51a4a9895871f1c9d1c57e77a944d168a850fdb769db84ba8663f4255d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4252.0.0-darwin-arm64.tar.gz"
      sha256 "6e014f10ac34410738fe489a6b6c2a5f0c6346a42fa86b4d82cf7abb420f569a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4252.0.0-linux-x64.tar.gz"
    sha256 "439f75e3616edebc5baf3050def1db4791218e8c8d1f781b8f9e729226051519"
  end
  version "4252.0.0"
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

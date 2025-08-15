require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6968.0.0-darwin-x64.tar.gz"
    sha256 "89d1c5d75b2cf5a56cda195ba72075a4e730500d9f9711d11f6e237145c8fbc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6968.0.0-darwin-arm64.tar.gz"
      sha256 "b7ca067dc341c1a81ae9c2c0c31c8fb6238b44c86d509044a3f205442e0eafbe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6968.0.0-linux-x64.tar.gz"
    sha256 "2453016c13bf10727dd60e2113b7e64803f25fae682670a8d0f50bce00aa2c53"
  end
  version "6968.0.0"
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

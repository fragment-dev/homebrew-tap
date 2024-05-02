require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4994.0.0-darwin-x64.tar.gz"
    sha256 "a77f290f237909560ff9c10cc10fc4bfd08c97162868c618064fdcd545ac9757"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4994.0.0-darwin-arm64.tar.gz"
      sha256 "3f5e9a5630d9995cd10e3ed930af4479a771f738e753c76dbbb6e5145f458c48"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4994.0.0-linux-x64.tar.gz"
    sha256 "8a8354480519e6242c5d0cc3eefb22a431a81749b95ba7e033f89cf15a35c173"
  end
  version "4994.0.0"
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

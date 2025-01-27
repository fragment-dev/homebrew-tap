require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6128.0.0-darwin-x64.tar.gz"
    sha256 "c2c206ee2940a0f02b3ef6c01dde7043e64ca81010ae41de1dfbf5a872a00c23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6128.0.0-darwin-arm64.tar.gz"
      sha256 "9c49d339792cafd8954204ad37cc8cffc6e9a2b82509956a52a1040db2b73f2c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6128.0.0-linux-x64.tar.gz"
    sha256 "cb19c8ff28069b1abe0263aa333eb55d674385aed4cda94d46086f1e754f3fc2"
  end
  version "6128.0.0"
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

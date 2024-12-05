require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5849.0.0-darwin-x64.tar.gz"
    sha256 "05e9f85eac9b4a4cf9316eeb0fd451dedf08ea80ec0c781c76edebb357a37f2c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5849.0.0-darwin-arm64.tar.gz"
      sha256 "53c465d4b718d8972040bf1f27b50577a476af6633d541cf2300882cafbc3054"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5849.0.0-linux-x64.tar.gz"
    sha256 "2ee93bec20c4f1b001e3c88a811f52783118577d45ff65b1ca297b56e2be8ae9"
  end
  version "5849.0.0"
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

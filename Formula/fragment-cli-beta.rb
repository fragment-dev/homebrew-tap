require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4260.0.0-darwin-x64.tar.gz"
    sha256 "0819cf885d29cfd0fd500b164a19ea7c8b6b665811980b36b18ad9bc721f4884"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4260.0.0-darwin-arm64.tar.gz"
      sha256 "b99f07dc90e022af4362a1f71ee6f251dc6cee23e02291c0e7715a7c120ecdfb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4260.0.0-linux-x64.tar.gz"
    sha256 "c9f3fe1267f68d36b1067bc9b64cae2b2c89be6539bc6063c8bc384c1bdabcd9"
  end
  version "4260.0.0"
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

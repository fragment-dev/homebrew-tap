require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4980.0.0-darwin-x64.tar.gz"
    sha256 "5b7313338c5ce67d58e4940840299c8857b8cce8a7e8a0546a6a48dd2692eeb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4980.0.0-darwin-arm64.tar.gz"
      sha256 "a07f6f4a0f542a942fc09c189d7a8a02adc7cb54683e27ed0d65cb533dbbb274"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4980.0.0-linux-x64.tar.gz"
    sha256 "206c92217819c9587da089078c0d9945527707c45fac993210badc7acc25a951"
  end
  version "4980.0.0"
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

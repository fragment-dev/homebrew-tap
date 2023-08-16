require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3333.0.0-darwin-x64.tar.gz"
    sha256 "1ee64c428a4da36ce21c3bc636de8b4914688adab370d0f78bc6135647053738"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3333.0.0-darwin-arm64.tar.gz"
      sha256 "295497b91cb23af72abe757119a897d1495f798fc630b88a522a47ece5c0b463"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3333.0.0-linux-x64.tar.gz"
    sha256 "74b49e221dd5d4dd694a01b94632e7eed8aba6cc710977997310a938b94c44b1"
  end
  version "3333.0.0"
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

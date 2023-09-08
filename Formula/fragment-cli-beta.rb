require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3504.0.0-darwin-x64.tar.gz"
    sha256 "0446a4fd82ed052ef83dbed553942d1a7b5d8ca36b89a9cd92c9ec2ac2247805"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3504.0.0-darwin-arm64.tar.gz"
      sha256 "a8d4dd8c8ac62d92ea7034e5a6e143b6c370c61410ba35304faa306652c5db6f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3504.0.0-linux-x64.tar.gz"
    sha256 "0601871a04a6a83c29706e74cfecafabc259c2f2caf724b33daa51e0f20c9390"
  end
  version "3504.0.0"
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

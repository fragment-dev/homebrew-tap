require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3959.0.0-darwin-x64.tar.gz"
    sha256 "94a5cc35874b519f7101a136f424d82d6956ebe5b66072132a3f5714f4319373"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3959.0.0-darwin-arm64.tar.gz"
      sha256 "b45d82eb82aa6e63863c83d393e5fbf53a7ac8006c93ec5b9ff6e5355e3c36f6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3959.0.0-linux-x64.tar.gz"
    sha256 "9a24a5cb9eecb8958be561236bf257f37bf3ecba8e7bfa1638483f7a29b53d71"
  end
  version "3959.0.0"
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

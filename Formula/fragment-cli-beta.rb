require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5857.0.0-darwin-x64.tar.gz"
    sha256 "e0a3ff064d84285575f673b5626df52d89dad8f017ecc83e626d0254519c0259"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5857.0.0-darwin-arm64.tar.gz"
      sha256 "abd42d9e516fb62702f9e7bc1f2a48b7fe011b60264666462cfe033bd3c2798f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5857.0.0-linux-x64.tar.gz"
    sha256 "ecc71df1c5578ae0a68cc7fafd9f86300fc1ee2c9cf2873c25296684a1af4af7"
  end
  version "5857.0.0"
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

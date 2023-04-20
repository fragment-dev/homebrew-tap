require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2493.0.0-darwin-x64.tar.gz"
    sha256 "26a7a81da930780c46e329e18e652cd4a2ae5c85aac57483e10d40e9fc4ffc1f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2493.0.0-darwin-arm64.tar.gz"
      sha256 "7daf238a02cdc5c3dec921a96f9c259f37431cf35df6f0ee6987206ccc7050c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2493.0.0-linux-x64.tar.gz"
    sha256 "2713e7182353faf17a6da0311e1c577e9ef311c1bc89c6ad436e0ed7975a6094"
  end
  version "2493.0.0"
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

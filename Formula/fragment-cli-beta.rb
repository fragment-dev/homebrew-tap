require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3452.0.0-darwin-x64.tar.gz"
    sha256 "c569ddc4e1d1c81fd1f272d19a21c01cf7b36b4eb4b91f7a8e97bdb444ed7dd8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3452.0.0-darwin-arm64.tar.gz"
      sha256 "1964282331186db5f67b8db48aa0c0a8ec7c54a3e58d8b090fe4f2c668ea394f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3452.0.0-linux-x64.tar.gz"
    sha256 "2b6e0ec6a6fc708c3cd1d03d8cc7c44727e3c12df73c8f0e599a36f543f12b75"
  end
  version "3452.0.0"
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

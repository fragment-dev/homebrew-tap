require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2718.0.0-darwin-x64.tar.gz"
    sha256 "d564c8b18449c3319d0d8c088c10fe17cc2bdafa77d20a857a5b12ca0fa5e972"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2718.0.0-darwin-arm64.tar.gz"
      sha256 "2adf0bbcbf329bf5636212b3024eca0dae7625225e6b849bed5770f59e9313c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2718.0.0-linux-x64.tar.gz"
    sha256 "b9ca047b2b8d4ec9cd13a0c01b9fbb2a589962362b3bf38b0fa38c8c1d92df5a"
  end
  version "2718.0.0"
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

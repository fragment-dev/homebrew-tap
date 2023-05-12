require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2639.0.0-darwin-x64.tar.gz"
    sha256 "3baffd3eec030237823a1c6971a4d6f22f9f7583d076dd3cc62e1f64a60b1590"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2639.0.0-darwin-arm64.tar.gz"
      sha256 "a4bff27edeffe1f717d5727374169406d5fc076cfbad8af59cf27c288a90f89e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2639.0.0-linux-x64.tar.gz"
    sha256 "55c878b5a17bf87b1ac1cdbb2a192dca79d77765c507c4562a77c7dbf7418c56"
  end
  version "2639.0.0"
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

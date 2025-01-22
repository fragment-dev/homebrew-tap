require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6110.0.0-darwin-x64.tar.gz"
    sha256 "15f8d061cdddeae5fd0f94dca02f7691151edc5b6e12194f02184614754c86ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6110.0.0-darwin-arm64.tar.gz"
      sha256 "192a4be4bd6c219db7a4bd0f4b1fd0c610108d5baac6d5299414d18da8683ef9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6110.0.0-linux-x64.tar.gz"
    sha256 "6c79567e7e22ab5673d4232c320cb4c5a9b447508ed12ee813361b3cd35a6e1f"
  end
  version "6110.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3776.0.0-darwin-x64.tar.gz"
    sha256 "28bb3da5f3b369c1e3fb6d6a1b3f3e571a5ff5b6da99a86f35d278f762b9e33b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3776.0.0-darwin-arm64.tar.gz"
      sha256 "7b3091ed9efff7d2752b8c9f703e1971e7b59a0ff5462952de0fc044ecfe7078"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3776.0.0-linux-x64.tar.gz"
    sha256 "0986de8bcf34082dd9f4816d9d2b6843c3b4c5115776c77c57c09d886075f74f"
  end
  version "3776.0.0"
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

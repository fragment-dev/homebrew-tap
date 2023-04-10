require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2394.0.0-darwin-x64.tar.gz"
    sha256 "d44f79925e64a97468996987fa33d810230a38619328c43ad6433b6e4a05bb38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2394.0.0-darwin-arm64.tar.gz"
      sha256 "e2e342c9888201fb6756e333d4241dba6cda3727089bdf47c06ffd452e93c49c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2394.0.0-linux-x64.tar.gz"
    sha256 "d50377643dfba996b8964795ba5b6af9d493604cf0adf4ee6bfd12dae4579dc9"
  end
  version "2394.0.0"
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

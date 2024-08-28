require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5549.0.0-darwin-x64.tar.gz"
    sha256 "c78775c497de505e12d3619034a3428424924a9d807271bf4c69d7ac304d6ced"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5549.0.0-darwin-arm64.tar.gz"
      sha256 "c827125674f09f3c17e20e56ca0b9d300cfa6c012c0ba7562303f320180d3ccc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5549.0.0-linux-x64.tar.gz"
    sha256 "ed6e5a2aeda4715a718e3e24cb5e4eda4b851475abe2b8757c3e4537e1556a8d"
  end
  version "5549.0.0"
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

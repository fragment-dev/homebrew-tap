require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5057.0.0-darwin-x64.tar.gz"
    sha256 "952cb69bf88d0ce0d786bb59d9d2abaa2c325d9dd0a90b4030ab28bf4cb91733"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5057.0.0-darwin-arm64.tar.gz"
      sha256 "f0c0a543fa3ef0d03fc378b90e03ce87cd1c7d47814dd5ea4b77b89e640445fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5057.0.0-linux-x64.tar.gz"
    sha256 "e20ee8a2d74d7148bcb9a343fc6479a35b121f1bd2abd37597b5f5ee252fcb58"
  end
  version "5057.0.0"
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

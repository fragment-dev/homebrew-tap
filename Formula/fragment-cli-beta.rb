require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5697.0.0-darwin-x64.tar.gz"
    sha256 "2de6862897e39eb7ea387cf6e078a08f8e83f1b9937598014c082aa6c13634c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5697.0.0-darwin-arm64.tar.gz"
      sha256 "50ee511f0884e7851e2f6192d69f20a7715aeeb2eb4b94b6fde666f28a59d982"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5697.0.0-linux-x64.tar.gz"
    sha256 "136986ab28b22cf12473f17f0a5b4741a67ada9d9a59956a52728c55e5eeec4b"
  end
  version "5697.0.0"
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

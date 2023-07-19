require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3131.0.0-darwin-x64.tar.gz"
    sha256 "3a0c85f7835ab5586342b1656c6d1b7e2712e641c516eddea90a1546b1c24935"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3131.0.0-darwin-arm64.tar.gz"
      sha256 "40294efeeadc3b76698224898eab8f7d6d790860a1c70716705de8c1ef201665"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3131.0.0-linux-x64.tar.gz"
    sha256 "132ac38ae7d14148deee9d12f56d02370944e572f3bb86bf8bbbcc066c4c6655"
  end
  version "3131.0.0"
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

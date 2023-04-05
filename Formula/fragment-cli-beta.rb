require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2358.0.0-darwin-x64.tar.gz"
    sha256 "c40d455642d6028a9daaf71eb672c7a149e312ef3aced4e1c9aaf9e405ef78e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2358.0.0-darwin-arm64.tar.gz"
      sha256 "2f80584fb3a7044ad33209bff08ccf135ca549ceab4e8b20b319d0dd6e397855"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2358.0.0-linux-x64.tar.gz"
    sha256 "099d263549480ad927832e19fb9f628d6a794733bb5e593d8415b202cca953d0"
  end
  version "2358.0.0"
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

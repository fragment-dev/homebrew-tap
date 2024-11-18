require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5792.0.0-darwin-x64.tar.gz"
    sha256 "eb6dfffa3563e7e9821856f53a2b1dd9cbc515a0d1e923f37b7eb92d79427c17"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5792.0.0-darwin-arm64.tar.gz"
      sha256 "07ef0d8feeac59fb76e3103396a7e0fa418f94212cf8e77db0d377ed016529a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5792.0.0-linux-x64.tar.gz"
    sha256 "35d14d93d793291f14df550d952e38d36312f87048421ef752c7ffc5e600d5bc"
  end
  version "5792.0.0"
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

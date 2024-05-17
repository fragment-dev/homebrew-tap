require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5079.0.0-darwin-x64.tar.gz"
    sha256 "3becf18dfd907adc2e368d4bc312064c3b47439901a9652612acd5f104b8e238"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5079.0.0-darwin-arm64.tar.gz"
      sha256 "8df263a14659826f86d8ef2df0cca00c5a68d12690195e3ac9ba257451677fc2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5079.0.0-linux-x64.tar.gz"
    sha256 "0feae69366e91596df01e4ad48d13a1ac487e514f1702533197611860a64d6a7"
  end
  version "5079.0.0"
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

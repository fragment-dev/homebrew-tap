require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3764.0.0-darwin-x64.tar.gz"
    sha256 "a797c30de78af72aa354dc9f190ab27154739dd7aae70a80808bf2358171e68e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3764.0.0-darwin-arm64.tar.gz"
      sha256 "6cc593f592a1cd5f5b202182eec948b4ca6bbf43391f4498294756bb69c1905c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3764.0.0-linux-x64.tar.gz"
    sha256 "43fb79564ee79a922f7f3c5b8c7ba760e835175c0e025b206013df4dcba11fea"
  end
  version "3764.0.0"
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

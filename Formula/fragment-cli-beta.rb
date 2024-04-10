require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4862.0.0-darwin-x64.tar.gz"
    sha256 "987cb97eef23b633d42fc18b0f7a0d7a9dcc929ae981f46f93c8be4d6fa67b66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4862.0.0-darwin-arm64.tar.gz"
      sha256 "e3ba41524ee8b4bf64a6810da84f1741957e194dc71d46a215b4623354e41840"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4862.0.0-linux-x64.tar.gz"
    sha256 "8d5ba9e6a75e752729a675ecc144d65a960a97de56293c020a6806fdaa03018f"
  end
  version "4862.0.0"
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

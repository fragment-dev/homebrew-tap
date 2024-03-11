require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4745.0.0-darwin-x64.tar.gz"
    sha256 "cf49b37b47a2e99479cf989d430e63cce3ab819967e6270eab7f2eb1f13f7320"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4745.0.0-darwin-arm64.tar.gz"
      sha256 "f57ea274cd08fde3c2e52b64f0108ada027209e2442e39cd07939bd58a43bcb5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4745.0.0-linux-x64.tar.gz"
    sha256 "52e8e0c1a9e622aa38b5a6f8044c7d4621aa48b0f18db85f27a998b5c3c21c1d"
  end
  version "4745.0.0"
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

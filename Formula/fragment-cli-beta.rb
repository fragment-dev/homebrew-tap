require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4461.0.0-darwin-x64.tar.gz"
    sha256 "3cd83d1729f542a0ac761f2015527ca98e8f5c3d0f9ccbe06d575072a4e38107"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4461.0.0-darwin-arm64.tar.gz"
      sha256 "bbee7a64c2523683fe6b107a743b7bf924654bb5b5870ea11b565eda5cf37ca1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4461.0.0-linux-x64.tar.gz"
    sha256 "079f06c71087bca1081b4aa66b475ad744d50de1b4d7e950f035a5957019f3e9"
  end
  version "4461.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

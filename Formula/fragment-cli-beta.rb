require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4285.0.0-darwin-x64.tar.gz"
    sha256 "0019055d9ee39ecad9f57060908419d3554e55acb8931e78735fbc93ac07e019"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4285.0.0-darwin-arm64.tar.gz"
      sha256 "2b522927c2e78ea4c46ff801d9a8f5ae8e9626a43e0073855e5af37e8d41aff7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4285.0.0-linux-x64.tar.gz"
    sha256 "fb52cd06247665054b61f9f62475f43e767372b7f5228aacf8017a9cac344c8e"
  end
  version "4285.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3639.0.0-darwin-x64.tar.gz"
    sha256 "de6f67dab9f3eac68fddf54b78fe3827452604f32418b3ba6c02650950c6d987"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3639.0.0-darwin-arm64.tar.gz"
      sha256 "67947bfc07828ef8cf1369a1255df2968f7cb6e691d4894b28d9b4edca13802a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3639.0.0-linux-x64.tar.gz"
    sha256 "39de66c943765f8e01c9dc1046206da8ca0a476bbd56669687c917f756359e26"
  end
  version "3639.0.0"
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

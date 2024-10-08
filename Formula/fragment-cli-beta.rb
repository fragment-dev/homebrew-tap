require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5652.0.0-darwin-x64.tar.gz"
    sha256 "8f652334c9aa4f27af61361d26261dc4caa623dd1af83f7659e07b8f053f21c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5652.0.0-darwin-arm64.tar.gz"
      sha256 "09676b9b50f8ef09dfd8090ed97ea302d3bfc048ea2f7c6946f455df20b6dae6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5652.0.0-linux-x64.tar.gz"
    sha256 "13b5c80938bddf118e79c3e2ad579ced285a526cdfe4ef974a7d76651efcfc95"
  end
  version "5652.0.0"
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

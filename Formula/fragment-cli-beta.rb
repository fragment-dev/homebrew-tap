require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5381.0.0-darwin-x64.tar.gz"
    sha256 "e7ad198816dd230141e90bbd73df0dab754aed66c03869275b4e460225ee9d70"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5381.0.0-darwin-arm64.tar.gz"
      sha256 "14eb6d6fee36083a43bdbc753ae8aa55d0fe49b2edb1a0eadb5c61520d48504c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5381.0.0-linux-x64.tar.gz"
    sha256 "3b91e21cf80abe0b29903f49495b30ebc14a9931521485253ba627a1127e9338"
  end
  version "5381.0.0"
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

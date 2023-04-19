require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2471.0.0-darwin-x64.tar.gz"
    sha256 "f12216d491283fe0b241386f0478cc092b2d3aab66598e56d4e1e4c5c677f4a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2471.0.0-darwin-arm64.tar.gz"
      sha256 "93b7fc488a84eafcfa4d8f3c2030d587ea7efbefdef4aced8e7ce462dce7b291"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2471.0.0-linux-x64.tar.gz"
    sha256 "22e02100d5bf2f42cff87fb1a2ddc32545311e5560b02d66c1b10c7201b0ea1d"
  end
  version "2471.0.0"
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
